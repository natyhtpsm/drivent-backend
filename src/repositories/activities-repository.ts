import { prisma } from '@/config';

async function findAll() {
  return prisma.activity.findMany({});
}

async function findUserReservation(userId: number) {
  return prisma.reservations.findUnique({
    where: {
      userId,
    },
  });
}

export const activityRepository = {
  findAll,
  findUserReservation,
};
