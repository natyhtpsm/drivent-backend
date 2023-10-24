import { notFoundError } from '@/errors';
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

export const activitiesService = {
  getActivities,
  handleUserActivity,
};
