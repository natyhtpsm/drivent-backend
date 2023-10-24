import { getAllActivities, getUserReservation } from '@/controllers/activities-controller';
import { Router } from 'express';
// import { getDefaultEvent } from '@/controllers';

const activitiesRouter = Router();

activitiesRouter.get('/', getAllActivities).get('/user', getUserReservation); // .all('/*', authenticateToken)

export { activitiesRouter };
