import { Router } from 'express';
import { createTicket, getTicket, getTicketTypes, createTicketType } from '@/controllers';
import { authenticateToken, validateBody } from '@/middlewares';
import { ticketSchema, ticketTypeSchema } from '@/schemas/tickets-schemas';


const ticketsRouter = Router();

ticketsRouter
  .all('/*', authenticateToken)
  .get('/types', getTicketTypes)
  .get('/', getTicket)
  .post('/', validateBody(ticketSchema), createTicket)
  .post('/types', validateBody(ticketTypeSchema), createTicketType);

export { ticketsRouter };
