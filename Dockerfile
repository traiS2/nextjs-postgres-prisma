# Use a lightweight Node.js image with Alpine Linux
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Install dependencies (excluding devDependencies)
# RUN npm install --production

# Copy remaining project files
COPY . .

# Generate Prisma Client (assuming schema.prisma exists)
RUN npx prisma generate

# Build the Next.js application
RUN npm run build

# Switch to a slimmer Node.js image for runtime
FROM node:18-slim AS runner

# Set working directory
WORKDIR /app

# Copy build artifacts
# COPY --from=builder /app/out .

# Expose Next.js port (default: 3000)
EXPOSE 3000

# Set environment variable for Prisma (optional)
ENV DATABASE_URL=postgres://default:w3Pcg5HTqiLV@ep-nameless-forest-21792820-pooler.us-east-1.aws.neon.tech:5432/verceldb?sslmode=require

# Start the Next.js application
CMD [ "npm", "start" ]
