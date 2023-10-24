import { prisma } from '@/config';

async function findAll() {
  return prisma.activity.findMany({});
}

async function findUserReservation(userId: number) {
  return prisma.reservations.findMany({
    where: {
      userId,
    },
  });
}

async function createReservation(userId: number, activityId: number) {
  return prisma.reservations.create({
    data: {
      userId: userId,
      activityId: activityId,
    },
  });
}

export const activityRepository = {
  findAll,
  findUserReservation,
  createReservation,
};
