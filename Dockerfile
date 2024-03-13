# Versão build

FROM golang:latest as builder

# Cria o diretório da aplicação
WORKDIR /app

# Copia tudo para o container
COPY . .

# CGO_ENABLED=0 pois a aplicação não depende do C
RUN GOOS=linux CGO_ENABLED=0 go build -ldflags="-w -s" -o ./server ./cmd/server/main.go

# Menor imagem possível
FROM scratch

# Copia o bin do Go para a nova imagem
COPY --from=builder /app/server .
COPY --from=builder /app/.env .

# Roda a aplicação
CMD [ "./server" ]