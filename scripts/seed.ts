const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function main() {
  const user1 = await prisma.user.create({
    data: {
      name: 'Alice',
      email: 'alice@example.com',
    },
  });

  const user2 = await prisma.user.create({
    data: {
      name: 'Bob',
      email: 'bob@example.com',
    },
  });

  const account1 = await prisma.account.create({
    data: {
      name: 'Alice',
      email: 'alice@example.com',
    },
  });

  const account2 = await prisma.account.create({
    data: {
      name: 'Bob',
      email: 'bob@example.com',
    },
  });

  console.log({ user1, user2, account1, account2 });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
