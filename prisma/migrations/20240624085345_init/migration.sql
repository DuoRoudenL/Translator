-- CreateTable
CREATE TABLE "Questions" (
    "question_id" INTEGER NOT NULL,
    "translation_id" INTEGER NOT NULL,
    "test_id" INTEGER NOT NULL,
    "is_direct" BOOLEAN NOT NULL,

    CONSTRAINT "Questions_pkey" PRIMARY KEY ("question_id")
);

-- CreateTable
CREATE TABLE "Answers" (
    "answer_id" INTEGER NOT NULL,
    "question_id" INTEGER NOT NULL,
    "is_correct" BOOLEAN NOT NULL,

    CONSTRAINT "Answers_pkey" PRIMARY KEY ("answer_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Answers_question_id_key" ON "Answers"("question_id");

-- AddForeignKey
ALTER TABLE "Answers" ADD CONSTRAINT "Answers_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "Questions"("question_id") ON DELETE RESTRICT ON UPDATE CASCADE;
