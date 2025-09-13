# Next Products

Aplicativo **Flutter** para gerenciamento de produtos.  
Permite **cadastrar, editar e remover itens** da lista de produtos, com persistência integrada via **Firebase**.  

O projeto demonstra arquitetura organizada, boas práticas no uso de widgets e integração com backend em nuvem.

---

## 🚀 Funcionalidades

- Tela de **Splash** ao iniciar o app.  
- Autenticação/Login de usuário.  
- Listagem de produtos em cards (`ProductCard`).  
- Cadastro de novos produtos.  
- Edição e remoção de produtos existentes.  
- Integração com **Firebase** para armazenamento.  

---

## 🛠️ Arquitetura

```
lib/
│── main.dart                  # Ponto de entrada da aplicação
│── splash_screen.dart          # Tela inicial (Splash)
│── login_screen.dart           # Tela de login
│── home_screen.dart            # Lista de produtos
│── edit_create_product_screen.dart # Adicionar/editar produto
│── product_card.dart           # Componente visual para produto
│── firebase_options.dart       # Configuração Firebase
```

- **Gerenciamento de Estado:** simples com `setState` (ou pode ser adaptado para Provider, Riverpod, etc.).  
- **Camadas bem separadas:** telas, widgets e integração com Firebase.  

---

## 📦 Tecnologias Utilizadas

- **Flutter 3+**  
- **Dart**  
- **Firebase (Firestore/Auth)**  
- Widgets personalizados (`ProductCard`)  
- Suporte multiplataforma (Android, iOS, Web, Desktop)  

---

## ▶️ Como Rodar o Projeto

### Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.  
- Conta Firebase configurada (substituir `firebase_options.dart` se necessário).  

### Passos

1. Clone este repositório:
   ```bash
   git clone https://github.com/seuusuario/next-products.git
   cd next-products
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Rode o app:
   ```bash
   flutter run
   ```

👉 Ou simplificado:
```bash
flutter pub get && flutter run
```

---

## 📌 Próximos Passos

- Adicionar autenticação social (Google/Facebook).  
- Criar testes unitários e de integração.  
- Melhorar UI/UX com animações.  
- Publicar o app na Google Play Store e Apple App Store.  
