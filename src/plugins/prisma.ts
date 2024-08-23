import { PrismaClient } from "@prisma/client";
import fp from "fastify-plugin"

export default fp(async (fastify, opts) => {
    
  const db = new PrismaClient();
  fastify.decorate("prisma", db);
})

declare module 'fastify' {
    export interface FastifyInstance {
      prisma: PrismaClient;
    }
}
  