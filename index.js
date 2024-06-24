const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  // Добавление пользователя
  const newUser = await prisma.users.create({
    data: {
      user_name: 'john_doe',
      password: 'securepassword123',
      email: 'john.doe@example.com',
    },
  });
  console.log('Created new user:', newUser);

  // Добавление группы слов
  const newGroup = await prisma.words_group.create({
    data: {
      user_id: newUser.user_id,
      group_name: 'Common Phrases',
      created_at: new Date(),
      updated_at: new Date(),
    },
  });
  console.log('Created new words group:', newGroup);

  // Добавление языка
  const newLanguage = await prisma.languages.create({
    data: {
      language: 'english',
    },
  });
  console.log('Created new language:', newLanguage);

  // Добавление слова
  const newWord = await prisma.words.create({
    data: {
      group_id: newGroup.group_id,
      word: 'Hello',
      language_id: newLanguage.language_id,
      part_of_speech: 'noun',
    },
  });
  console.log('Created new word:', newWord);

  // Добавление теста
  const newTest = await prisma.tests.create({
    data: {
      group_id: newGroup.group_id,
      user_id: newUser.user_id,
      created_at: new Date(),
    },
  });
  console.log('Created new test:', newTest);

  // Добавление результата теста
  const newTestResult = await prisma.test_results.create({
    data: {
      test_id: newTest.test_id,
      score: 85,
    },
  });
  console.log('Created new test result:', newTestResult);

  // Добавление перевода
  const newTranslation = await prisma.translations.create({
    data: {
      original_word_id: newWord.word_id,
      original_language_id: newLanguage.language_id,
      translated_word_id: newWord.word_id, // предполагаем, что у вас есть перевод слова, здесь используется тот же id для примера
      translated_language_id: newLanguage.language_id,
      group_id: newGroup.group_id,
    },
  });
  console.log('Created new translation:', newTranslation);

  // Добавление вопроса
  const newQuestion = await prisma.questions.create({
    data: {
      translation_id: newTranslation.translation_id,
      test_id: newTest.test_id,
      is_direct: true,
    },
  });
  console.log('Created new question:', newQuestion);

  // Добавление ответа
  const newAnswer = await prisma.answers.create({
    data: {
      question_id: newQuestion.question_id,
      is_correct: true,
    },
  });
  console.log('Created new answer:', newAnswer);
}

main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
