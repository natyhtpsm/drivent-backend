import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { eventsService } from '@/services';
import { redis } from '@/server';
import { activitiesService } from '@/services/activities-service';

export async function getAllActivities(_req: Request, res: Response) {
  const activities = await activitiesService.getActivities();
  return res.status(httpStatus.OK).send(activities);
}
