import { notFoundError, unauthorizedError } from '@/errors';
import { activityRepository } from '@/repositories';

async function getActivities() {
  const activities = await activityRepository.findAll();
  if (!activities) throw notFoundError();
  return activities;
}

async function handleUserActivity(userId: number) {
  const activity = await activityRepository.findUserReservation(userId);
  if (!activity) throw notFoundError();
  return activity;
}

async function handleNewReservation(userId: number, activityId: number) {
  const newReservation = await activityRepository.createReservation(userId, activityId);
  if (!newReservation) throw unauthorizedError();
  return newReservation;
}

export const activitiesService = {
  getActivities,
  handleUserActivity,
  handleNewReservation,
};
