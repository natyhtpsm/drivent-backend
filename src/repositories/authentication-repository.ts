import { Prisma } from '@prisma/client';
import { prisma } from '@/config';

async function createSession(data: Prisma.SessionUncheckedCreateInput) {
  return prisma.session.create({
    data,
  });
}

async function findSession(token: string) {
  return prisma.session.findFirst({
    where: {
      token,
    },
  });
}

async function updateSession(token: string, email: string) {
  
  const resu = await prisma.user.findUnique({
    where: {
      email
    }
  })
  console.log(resu)
  const result = await prisma.session.findFirst({
    where: {
      userId: resu.id
    },
  });

  return prisma.session.update({
    data: {
      token
    },
    where: {
      id: result.id
    }
  });
}

export const authenticationRepository = {
  createSession,
  findSession,
  updateSession
};
