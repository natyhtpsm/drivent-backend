import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { eventsService } from '@/services';
import { redis } from '@/config/redisConfig';
import { activitiesService } from '@/services/activities-service';
import { AuthenticatedRequest } from '@/middlewares';

export async function getAllActivities(_req: Request, res: Response) {
  const activities = await activitiesService.getActivities();
  return res.status(httpStatus.OK).send(activities);
}

export async function getUserReservation(req: AuthenticatedRequest, res: Response) {
  const { userId } = req;
  const activity = await activitiesService.handleUserActivity(userId);
  return res.status(httpStatus.OK).send(activity);
}

export async function postReservation(req: AuthenticatedRequest, res: Response) {
  const { userId } = req;
  const activityId = Number(req.body.activityId);
  const newReservation = await activitiesService.handleNewReservation(userId, activityId);
  return res.status(httpStatus.OK).send(newReservation);
}
