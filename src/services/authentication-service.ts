import { User } from '@prisma/client';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { invalidCredentialsError } from '@/errors';
import { authenticationRepository, userRepository } from '@/repositories';
import { exclude } from '@/utils/prisma-utils';
import axios from 'axios';
import { GitHubParamsForAccessToken } from '../protocols';
import dotenv from "dotenv"
import qs from 'query-string';
dotenv.config()


async function getGitHubUser(token: string) {
  const GITHUB_USER_URL = "https://api.github.com/user";
  const response = await axios.get(GITHUB_USER_URL, {
    headers:{
      Authorization: `Bearer ${token}`
    }
  })
  return response.data;
}

async function loginIserWithGitHub(code: string) {
  const token = await exchangeCodeForToken(code)

  return token;
}

async function exchangeCodeForToken(code: string) {
  const GITHUB_ACCESS_TOKEN_URL = "https://github.com/login/oauth/access_token";
  const {REDIRECT_URL, CLIENT_ID, CLIENT_SECRET} = process.env
  const params: GitHubParamsForAccessToken = {
    code,
    grant_type: "authorization_code",
    redirect_uri: REDIRECT_URL,
    client_id: CLIENT_ID,
    client_secret: CLIENT_SECRET

  }

    const { data } = await axios.post(GITHUB_ACCESS_TOKEN_URL, params, {
      headers: {
        'Content-Type': 'application/json'
      }
    });
    const {access_token} = qs.parse(data);
    console.log(access_token)
    return Array.isArray(access_token) ? access_token.join("") : access_token


}

async function signIn(params: SignInParams): Promise<SignInResult> {
  const { email, password } = params;

  const user = await getUserOrFail(email);

  await validatePasswordOrFail(password, user.password);

  const token = await createSession(user.id);

  return {
    user: exclude(user, 'password'),
    token,
  };
}

async function getUserOrFail(email: string): Promise<GetUserOrFailResult> {
  const user = await userRepository.findByEmail(email, { id: true, email: true, password: true });
  if (!user) throw invalidCredentialsError();

  return user;
}

async function createSession(userId: number) {
  const token = jwt.sign({ userId }, process.env.JWT_SECRET);
  await authenticationRepository.createSession({
    token,
    userId,
  });

  return token;
}

async function validatePasswordOrFail(password: string, userPassword: string) {
  const isPasswordValid = await bcrypt.compare(password, userPassword);
  if (!isPasswordValid) throw invalidCredentialsError();
}

export type SignInParams = Pick<User, 'email' | 'password'>;

type SignInResult = {
  user: Pick<User, 'id' | 'email'>;
  token: string;
};

type GetUserOrFailResult = Pick<User, 'id' | 'email' | 'password'>;

export const authenticationService = {
  signIn,
  loginIserWithGitHub,
  getGitHubUser
};
