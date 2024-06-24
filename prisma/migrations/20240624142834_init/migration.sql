/*
  Warnings:

  - Changed the type of `language` on the `languages` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `part_of_speech` on the `words` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "Language" AS ENUM ('russian', 'english');

-- CreateEnum
CREATE TYPE "PathOfSpeech" AS ENUM ('noun', 'adjective', 'verb');

-- AlterTable
ALTER TABLE "languages" DROP COLUMN "language",
ADD COLUMN     "language" "Language" NOT NULL;

-- AlterTable
ALTER TABLE "words" DROP COLUMN "part_of_speech",
ADD COLUMN     "part_of_speech" "PathOfSpeech" NOT NULL;
