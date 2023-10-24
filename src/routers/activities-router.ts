import { getAllActivities } from '@/controllers/activities-controller';
import { Router } from 'express';
// import { getDefaultEvent } from '@/controllers';

const activitiesRouter = Router();

activitiesRouter.get('/', getAllActivities); // .all('/*', authenticateToken)

export { activitiesRouter };
