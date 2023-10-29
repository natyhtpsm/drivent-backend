import httpStatus from 'http-status';
import supertest from 'supertest';
import app, { init } from '../../src/app';
import RedisClient from '../../src/config/redisConfig';

beforeAll(async () => {
  await init();
  RedisClient.connect();
});

afterAll(async () => {
  RedisClient.disconnect();
});

const server = supertest(app);

describe('GET /health', () => {
  it('should respond with status 200 with OK! text', async () => {
    const response = await server.get('/health');

    expect(response.status).toBe(httpStatus.OK);
    expect(response.text).toBe('OK!');
  });
});
