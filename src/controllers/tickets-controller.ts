import { Response } from 'express';
import httpStatus from 'http-status';
import { AuthenticatedRequest } from '@/middlewares';
import { ticketsService } from '@/services';
import { InputTicketBody } from '@/protocols';
import { prisma } from '@/config';

export async function getTicketTypes(req: AuthenticatedRequest, res: Response) {
  const ticketTypes = await ticketsService.findTicketTypes();
  return res.status(httpStatus.OK).send(ticketTypes);
}

export async function getTicket(req: AuthenticatedRequest, res: Response) {
  const { userId } = req;
  const ticket = await ticketsService.getTicketByUserId(userId);
  res.status(httpStatus.OK).send(ticket);
}

export async function createTicket(req: AuthenticatedRequest, res: Response) {
  const { userId } = req;
  const { ticketTypeId } = req.body as InputTicketBody;

  const ticket = await ticketsService.createTicket(userId, ticketTypeId);
  return res.status(httpStatus.CREATED).send(ticket);
}


export async function createTicketType(req: AuthenticatedRequest, res: Response) {
  try {
    const { name, price, isRemote, includesHotel } = req.body;
    const createdTicketType = await prisma.ticketType.create({
      data: {
        name,
        price,
        isRemote,
        includesHotel,
      },
    });

    return res.status(httpStatus.CREATED).json(createdTicketType);
  } catch (error) {
      console.error('Error creating ticket type:', error);
    return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({ error: 'Failed to create ticket type' });
  }
}

