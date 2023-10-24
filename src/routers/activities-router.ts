import { Router } from 'express';
import { getAllActivities, getUserReservation, postReservation } from '@/controllers/activities-controller';
import { authenticateToken } from '@/middlewares';

const activitiesRouter = Router();

activitiesRouter
  .all('/*', authenticateToken)
  .get('/', getAllActivities)
  .get('/user', getUserReservation)
  .post('/reservation', postReservation); //

export { activitiesRouter };
