/*
  Warnings:

  - A unique constraint covering the columns `[activityId]` on the table `Reservations` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
CREATE SEQUENCE "reservations_id_seq";
ALTER TABLE "Reservations" ALTER COLUMN "id" SET DEFAULT nextval('reservations_id_seq'),
ADD CONSTRAINT "Reservations_pkey" PRIMARY KEY ("id");
ALTER SEQUENCE "reservations_id_seq" OWNED BY "Reservations"."id";

-- CreateIndex
CREATE UNIQUE INDEX "Reservations_activityId_key" ON "Reservations"("activityId");
