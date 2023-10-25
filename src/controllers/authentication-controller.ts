import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { authenticationService, SignInParams} from '@/services';

export async function singInPost(req: Request, res: Response) {
  if(req.body.code) {
  }
  const { email, password } = req.body as SignInParams;

  const result = await authenticationService.signIn({ email, password });

  return res.status(httpStatus.OK).send(result);
}

export async function loginGitHub(req: Request, res: Response) {
  const code = req.body.code as string;
  try {
    const token = await authenticationService.loginIserWithGitHub(code);
    res.send(token)
  } catch (error) {
    console.log(error)
  }
}

export async function getGitHubProfile(req: Request, res: Response) {
  const {user} = res.locals;
  return res.send(user)
}