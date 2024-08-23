import { FastifyPluginAsync } from "fastify";

const users: FastifyPluginAsync = async (fastify, ops): Promise<void> => {
    fastify.get('/', async (request, reply) => {
        return fastify.prisma.Vehicle.findMany()
    })

    fastify.post('/', async (request, reply) => {
        var body:any = request.body

        return fastify.prisma.Vehicle.create({
            data: {
                model: body.model,
                Brand: body.Brand,
                Color: body.Color,
                Plate: body.Plate,
                Year: body.Year,
                Seats: body.Seats
            }
        })
    })
}

export default users;