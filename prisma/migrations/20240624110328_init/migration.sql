-- CreateTable
CREATE TABLE "Word" (
    "word_id" SERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "word" TEXT NOT NULL,
    "language_id" INTEGER NOT NULL,
    "part_of_speech" TEXT NOT NULL,

    CONSTRAINT "Word_pkey" PRIMARY KEY ("word_id")
);

-- AddForeignKey
ALTER TABLE "Word" ADD CONSTRAINT "Word_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "WordsGroup"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;
