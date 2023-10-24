import { prisma } from '@/config';

async function findAll() {
  return prisma.activity.findMany({});
}

export const activityRepository = {
  findAll,
};
