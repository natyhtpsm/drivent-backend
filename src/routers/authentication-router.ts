import { Router } from 'express';
import { getGitHubProfile, loginGitHub, singInPost } from '@/controllers';
import { authenticateTokenGitHub, validateBody } from '@/middlewares';
import { signInSchema } from '@/schemas';

const authenticationRouter = Router();

authenticationRouter.post('/sign-in', validateBody(signInSchema), singInPost);
authenticationRouter.post('/login-git', loginGitHub);
authenticationRouter.get('/gitprofile', authenticateTokenGitHub, getGitHubProfile);
export { authenticationRouter };
