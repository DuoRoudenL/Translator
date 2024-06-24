-- CreateTable
CREATE TABLE "WordsGroup" (
    "group_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "group_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WordsGroup_pkey" PRIMARY KEY ("group_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "WordsGroup_group_name_key" ON "WordsGroup"("group_name");

-- AddForeignKey
ALTER TABLE "WordsGroup" ADD CONSTRAINT "WordsGroup_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
