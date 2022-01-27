# Cumbuca

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


## Rotas 

### Cadastro de conta
*Request:*
```css
post /sign_up
```
*Body:*
```json
{
	"user": {
		"name": "Cumbuca User",
		"cpf": "000.000.000-00",
		"email": "user@mail.com",
		"password": "secret"
	}
}
```
*Response:*
```json
{
  "id": 1,
  "message": "Conta criada com sucesso!"
}
```

### Autenticação
*Request:*
```css
post /sign_in
```
*Body:*
```json
{
	"session": {
		"email": "user@mail.com",
		"password": "secret"
	}
}
```
*Response:*
```json
{
  "data": {
    "email": "user@mail.com",
    "id": 3,
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJDdW1idWNhIiwiZXhwIjoxNjQ1NzI1Mzc5LCJpYXQiOjE2NDMzMDYxNzksImlzcyI6IkN1bWJ1Y2EiLCJqdGkiOiI4Mzc5NDc3Yi1kZTNkLTQ5ZDUtOWVhMi05OWFkYTg3OTZhZmYiLCJuYmYiOjE2NDMzMDYxNzgsInN1YiI6InVzZXJAbWFpbC5jb20iLCJ0eXAiOiJhY2Nlc3MifQ.BRBCAwqpoQh0OIgiv9gcYVPONe_4TdaZ7BD0U1cdgk5lJHhDdlMSjNQ9UaRV6Xi3G5RoaDbzxs80e76r_3tKIA"
  }
}
```
### ⚠️ As funcionalidades abaixo utilizam autenticação por meio de [JWT](https://jwt.io/) no modelo Bearer Authentication:
```html
Authorization: Bearer <token>
```

### Cadastro de transação

*Request:*
```css
post /transaction
```
*Body:*
```json
{
	"transaction": {
		"receiver_id": 2,
		"amount": 20
	}
}
```
*Response:*
```json
{
  "new_balance": 60,
  "transaction": {
    "amount": 20,
    "id": 14,
    "process_data": "2022-01-27 18:29:44",
    "receiver": 2
  }
}
```

### Estorno de transação
*Request:*
```css
post /refund
```
*Body:*
```json
{
	"transaction_id": 14
}
```
*Response:*
```json
{
  "new_balance": 20,
  "transaction": {
    "amount": 20,
    "id": 14,
    "process_data": "2022-01-27 18:29:44",
    "receiver": 2
  }
}
```

### Busca de transações por data
Formato da data: `yyyy-mm-dd hh:mm:ss` ou apenas por dia `yyyy-mm-dd`
*Request:*
```css
get /transaction?intial_date=2022-01-25%2005%3A00%3A51&final_date=2022-01-27%2018%3A29%3A44
```
*Query:*
```html
intial_date: 2022-01-25 05:00:51
final_date: 2022-01-27 18:29:44
```
*Response:*
```json
{
  "data": [
    {
      "transaction": {
        "amount": 20,
        "id": 10,
        "process_data": "2022-01-25 05:00:51.000000",
        "receiver": 2,
        "sender": 1
      }
    },
    {
      "transaction": {
        "amount": 20,
        "id": 13,
        "process_data": "2022-01-27 17:49:54.000000",
        "receiver": 2,
        "sender": 1
      }
    },
    {
      "transaction": {
        "amount": 20,
        "id": 14,
        "process_data": "2022-01-27 18:29:44.000000",
        "receiver": 2,
        "sender": 1
      }
    }
  ]
}
```
### Visualização de saldo
*Request:*
```css
get /balance
```
*Response:*
```json
{
  "balance": 40
}
```
