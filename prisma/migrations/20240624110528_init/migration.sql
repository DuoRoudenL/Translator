-- CreateTable
CREATE TABLE "Test" (
    "test_id" SERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Test_pkey" PRIMARY KEY ("test_id")
);

-- AddForeignKey
ALTER TABLE "Test" ADD CONSTRAINT "Test_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "WordsGroup"("group_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Test" ADD CONSTRAINT "Test_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
