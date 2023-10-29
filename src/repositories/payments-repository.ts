import { prisma } from '@/config';
import { PaymentParams } from '@/protocols';
import { TicketStatus } from '@prisma/client';

async function findPaymentByTicketId(ticketId: number) {
  const result = await prisma.payment.findFirst({
    where: { ticketId },
  });
  return result;
}

async function createPayment(ticketId: number, params: PaymentParams) {
  const [result] = await prisma.$transaction([
    prisma.payment.create({
      data: {
        ticketId,
        ...params,
      },
    }),
    prisma.ticket.update({
      where: {
        id: ticketId,
      },
      data: {
        status: TicketStatus.PAID,
      },
    }),
  ]);

  return result;
}

export const paymentsRepository = {
  findPaymentByTicketId,
  createPayment,
};
