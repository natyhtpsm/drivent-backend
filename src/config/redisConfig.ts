import { Redis } from 'ioredis';

export default class RedisClient {
  public static instance: Redis;

  static connect() {
    this.instance = new Redis(process.env.REDIS_URL);
  }

  static disconnect() {
    if (this.instance) {
      this.instance.disconnect();
    }
  }
}
