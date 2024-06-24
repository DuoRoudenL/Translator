/*
  Warnings:

  - You are about to drop the `Answer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Language` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Question` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TestResult` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Translation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Word` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WordsGroup` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_question_id_fkey";

-- DropForeignKey
ALTER TABLE "Question" DROP CONSTRAINT "Question_test_id_fkey";

-- DropForeignKey
ALTER TABLE "Question" DROP CONSTRAINT "Question_translation_id_fkey";

-- DropForeignKey
ALTER TABLE "Test" DROP CONSTRAINT "Test_group_id_fkey";

-- DropForeignKey
ALTER TABLE "Test" DROP CONSTRAINT "Test_user_id_fkey";

-- DropForeignKey
ALTER TABLE "TestResult" DROP CONSTRAINT "TestResult_test_id_fkey";

-- DropForeignKey
ALTER TABLE "Translation" DROP CONSTRAINT "Translation_group_id_fkey";

-- DropForeignKey
ALTER TABLE "Translation" DROP CONSTRAINT "Translation_original_language_id_fkey";

-- DropForeignKey
ALTER TABLE "Translation" DROP CONSTRAINT "Translation_original_word_id_fkey";

-- DropForeignKey
ALTER TABLE "Word" DROP CONSTRAINT "Word_group_id_fkey";

-- DropForeignKey
ALTER TABLE "Word" DROP CONSTRAINT "Word_language_id_fkey";

-- DropForeignKey
ALTER TABLE "WordsGroup" DROP CONSTRAINT "WordsGroup_user_id_fkey";

-- DropTable
DROP TABLE "Answer";

-- DropTable
DROP TABLE "Language";

-- DropTable
DROP TABLE "Question";

-- DropTable
DROP TABLE "Test";

-- DropTable
DROP TABLE "TestResult";

-- DropTable
DROP TABLE "Translation";

-- DropTable
DROP TABLE "Word";

-- DropTable
DROP TABLE "WordsGroup";
