import { notFoundError } from '@/errors';
import { activityRepository } from '@/repositories';

async function getActivities() {
  const activities = await activityRepository.findAll();
  if (!activities) throw notFoundError();

  return activities;
}

export const activitiesService = {
  getActivities,
};
