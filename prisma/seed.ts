import { PrismaClient } from "@prisma/client";
import dayjs from "dayjs";
const prisma = new PrismaClient();

async function main() {
  let event = await prisma.event.findFirst();
  if (!event) {
    event = await prisma.event.create({
      data: {
        title: "Driven.t",
        logoImageUrl: "https://files.driven.com.br/images/logo-rounded.png",
        backgroundImageUrl: "linear-gradient(to right, #FA4098, #FFD77F)",
        startsAt: dayjs().toDate(),
        endsAt: dayjs().add(21, "days").toDate(),
      },
    });
  }

  console.log({ event });

  const activities = [
    {
      name: "Atividade 1",
      description: "Descrição da Atividade 1",
      schedule: dayjs().add(1, "day").toDate(),
      capacity: 100,
    },
    {
      name: "Atividade 2",
      description: "Descrição da Atividade 2",
      schedule: dayjs().add(2, "days").toDate(),
      capacity: 150,
    },
    {
      name: "Atividade 3",
      description: "Descrição da Atividade 3",
      schedule: dayjs().add(3, "days").toDate(),
      capacity: 80,
    },
    {
      name: "Atividade 4",
      description: "Descrição da Atividade 4",
      schedule: dayjs().add(4, "days").toDate(),
      capacity: 120,
    },
    {
      name: "Atividade 5",
      description: "Descrição da Atividade 5",
      schedule: dayjs().add(5, "days").toDate(),
      capacity: 90,
    },
    {
      name: "Atividade 6",
      description: "Descrição da Atividade 6",
      schedule: dayjs().add(6, "days").toDate(),
      capacity: 110,
    },
    {
      name: "Atividade 7",
      description: "Descrição da Atividade 7",
      schedule: dayjs().add(7, "days").toDate(),
      capacity: 130,
    },
    {
      name: "Atividade 8",
      description: "Descrição da Atividade 8",
      schedule: dayjs().add(8, "days").toDate(),
      capacity: 70,
    },
    {
      name: "Atividade 9",
      description: "Descrição da Atividade 9",
      schedule: dayjs().add(9, "days").toDate(),
      capacity: 160,
    },
    {
      name: "Atividade 10",
      description: "Descrição da Atividade 10",
      schedule: dayjs().add(10, "days").toDate(),
      capacity: 140,
    },
  ];  

  for (const activity of activities) {
    await prisma.activity.create({
      data: {
        ...activity,
      },
    });
  }
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
