import { NextFunction, Request, Response } from 'express';
import * as jwt from 'jsonwebtoken';
import { unauthorizedError } from '@/errors';
import { authenticationRepository } from '@/repositories';
import {authenticationService} from "../services/authentication-service"
import { userService } from '../services';
import { generateRandomPassword } from '../utils/random-utils';

export async function authenticateToken(req: AuthenticatedRequest, res: Response, next: NextFunction) {
  const authHeader = req.header('Authorization');
  if (!authHeader) throw unauthorizedError();
  const token = authHeader.split(' ')[1];
  if (!token) throw unauthorizedError();
  console.log(token)
  if(token.charAt(0) === 'g') {

    const session = await authenticationRepository.findSession(token);
    if (!session) throw unauthorizedError();

    req.userId = session.userId;

    return next();
  }
  const { userId } = jwt.verify(token, process.env.JWT_SECRET) as JWTPayload;

  const session = await authenticationRepository.findSession(token);
  if (!session) throw unauthorizedError();

  req.userId = userId;
  next();
}

export type AuthenticatedRequest = Request & JWTPayload;

type JWTPayload = {
  userId: number;
};

export async function authenticateTokenGitHub(req: Request, res: Response, next: NextFunction) {
  const authHeader = req.header('Authorization');
  if (!authHeader) throw unauthorizedError();

  const token = authHeader.split(' ')[1];
  if (!token) throw unauthorizedError();
  console.log(token)
  const userGitHub = await authenticationService.getGitHubUser(token)
  res.locals.user = userGitHub;
  if (!userGitHub) throw unauthorizedError();

  

  const session = await authenticationRepository.findSession(token);
  console.log(session)
  if (!session) {
    const password = generateRandomPassword(14)
    if(userGitHub.email === null) return console.log("usuário com email privado no github");
    const datauser = {
      email: userGitHub.email,
      password
    }
    const user = await userService.createUser(datauser)
    const data = {
      token,
      userId: user.id
    }
    const createSession = await authenticationRepository.createSession(data);
  }
  
  return next()
}