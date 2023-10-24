/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `Reservations` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `Reservations` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Reservations" DROP CONSTRAINT "Reservations_enrollmentId_fkey";

-- DropIndex
DROP INDEX "Reservations_enrollmentId_key";

-- AlterTable
ALTER TABLE "Reservations" ADD COLUMN     "userId" INTEGER NOT NULL,
ALTER COLUMN "enrollmentId" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Reservations_userId_key" ON "Reservations"("userId");

-- AddForeignKey
ALTER TABLE "Reservations" ADD CONSTRAINT "Reservations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reservations" ADD CONSTRAINT "Reservations_enrollmentId_fkey" FOREIGN KEY ("enrollmentId") REFERENCES "Enrollment"("id") ON DELETE SET NULL ON UPDATE CASCADE;
