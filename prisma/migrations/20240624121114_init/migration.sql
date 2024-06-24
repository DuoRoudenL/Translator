/*
  Warnings:

  - You are about to drop the `Answer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Language` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Question` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TestResult` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Translation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
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
ALTER TABLE "Translation" DROP CONSTRAINT "Translation_translated_language_id_fkey";

-- DropForeignKey
ALTER TABLE "Translation" DROP CONSTRAINT "Translation_translated_word_id_fkey";

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
DROP TABLE "User";

-- DropTable
DROP TABLE "Word";

-- DropTable
DROP TABLE "WordsGroup";

-- CreateTable
CREATE TABLE "users" (
    "user_id" SERIAL NOT NULL,
    "user_name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "words_group" (
    "group_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "group_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "words_group_pkey" PRIMARY KEY ("group_id")
);

-- CreateTable
CREATE TABLE "words" (
    "word_id" SERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "word" TEXT NOT NULL,
    "language_id" INTEGER NOT NULL,
    "part_of_speech" TEXT NOT NULL,

    CONSTRAINT "words_pkey" PRIMARY KEY ("word_id")
);

-- CreateTable
CREATE TABLE "tests" (
    "test_id" SERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tests_pkey" PRIMARY KEY ("test_id")
);

-- CreateTable
CREATE TABLE "test_results" (
    "result_id" SERIAL NOT NULL,
    "test_id" INTEGER NOT NULL,
    "score" INTEGER NOT NULL,

    CONSTRAINT "test_results_pkey" PRIMARY KEY ("result_id")
);

-- CreateTable
CREATE TABLE "translations" (
    "translation_id" SERIAL NOT NULL,
    "original_word_id" INTEGER NOT NULL,
    "original_language_id" INTEGER NOT NULL,
    "translated_word_id" INTEGER NOT NULL,
    "translated_language_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "translations_pkey" PRIMARY KEY ("translation_id")
);

-- CreateTable
CREATE TABLE "questions" (
    "question_id" SERIAL NOT NULL,
    "translation_id" INTEGER NOT NULL,
    "test_id" INTEGER NOT NULL,
    "is_direct" BOOLEAN NOT NULL,

    CONSTRAINT "questions_pkey" PRIMARY KEY ("question_id")
);

-- CreateTable
CREATE TABLE "answers" (
    "answer_id" SERIAL NOT NULL,
    "question_id" INTEGER NOT NULL,
    "is_correct" BOOLEAN NOT NULL,

    CONSTRAINT "answers_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "languages" (
    "language_id" SERIAL NOT NULL,
    "language" TEXT NOT NULL,

    CONSTRAINT "languages_pkey" PRIMARY KEY ("language_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_user_name_key" ON "users"("user_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "words_group_group_name_key" ON "words_group"("group_name");

-- AddForeignKey
ALTER TABLE "words_group" ADD CONSTRAINT "words_group_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "words" ADD CONSTRAINT "words_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "words_group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "words" ADD CONSTRAINT "words_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages"("language_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tests" ADD CONSTRAINT "tests_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "words_group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tests" ADD CONSTRAINT "tests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "test_results" ADD CONSTRAINT "test_results_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "tests"("test_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "translations" ADD CONSTRAINT "translations_original_word_id_fkey" FOREIGN KEY ("original_word_id") REFERENCES "words"("word_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "translations" ADD CONSTRAINT "translations_translated_word_id_fkey" FOREIGN KEY ("translated_word_id") REFERENCES "words"("word_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "translations" ADD CONSTRAINT "translations_original_language_id_fkey" FOREIGN KEY ("original_language_id") REFERENCES "languages"("language_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "translations" ADD CONSTRAINT "translations_translated_language_id_fkey" FOREIGN KEY ("translated_language_id") REFERENCES "languages"("language_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "translations" ADD CONSTRAINT "translations_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "words_group"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "questions" ADD CONSTRAINT "questions_translation_id_fkey" FOREIGN KEY ("translation_id") REFERENCES "translations"("translation_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "questions" ADD CONSTRAINT "questions_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "tests"("test_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "answers" ADD CONSTRAINT "answers_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "questions"("question_id") ON DELETE RESTRICT ON UPDATE CASCADE;
