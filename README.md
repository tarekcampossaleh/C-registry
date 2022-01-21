# Desafio Técnico Back-End AppCumbuca

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


## Etapas do Desenvolvimento

### Funcionalidades

#### Cadastro de conta
- [ ] metodos de criação de conta
- [ ] validação de conta?
- [ ] create_user: checar se o user existis
- [ ] validações user no schema com validate_required
- [ ] 
#### Autenticação
- [ ] descobrir sobre jwt
- [ ] usuario logado
- [ ] 
#### Cadastro de transação
- [x] migrações banco de dados
- [x] schema
- [x] operações banco de dados
- [x] registro da transação
- [ ] cadastro por email
- [ ] 
- [ ] 
#### Estorno
- [ ] criar schema refoundable?: boolean default true
- [ ] validação se quem tá solicitnado o reembolso é o receiver_id
- [ ] pegar o valor da transação solicitada
- [ ] trocar o valor de refonduable de true pra false
- [ ] solicita uma nova charge com os valores obtidos
#### Busca de transação por data
- [ ] Query SQL, descobrir como implementá-las no ecto
#### Visualização de saldo
- [ ] Usuario logado
- [ ] criar função check_balance
#### Funcionalidades gerais
- [ ] Sistema de Log melhorado

#### GraphQl
- [ ] setup 
- [ ] auth
- [ ] endpoint Cadastro
- [ ] endpoint Auth
- [ ] endpoint Cadastro Transação
- [ ] endpoint Estorno Transação
- [ ] endpoint Busca por Data
- [ ] endpoint Visualização de saldo

#### Testes
