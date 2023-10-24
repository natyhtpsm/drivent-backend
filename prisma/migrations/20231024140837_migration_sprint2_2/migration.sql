/*
  Warnings:

  - You are about to drop the column `enrollmentId` on the `Reservations` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Reservations" DROP CONSTRAINT "Reservations_enrollmentId_fkey";

-- AlterTable
ALTER TABLE "Reservations" DROP COLUMN "enrollmentId";

-- AddForeignKey
ALTER TABLE "Reservations" ADD CONSTRAINT "Reservations_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Activity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
