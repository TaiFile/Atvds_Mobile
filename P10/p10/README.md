# P10 - Cadastro de Pessoas

Aplicativo Flutter para cadastro de pessoas, utilizando Floor (SQLite), Provider e arquitetura MVVM com camadas separadas.

## Estrutura do projeto

```
lib/
├── main.dart
├── repository/
│   ├── person.dart              # Entidade
│   ├── person_repository.dart   # Repositório
│   └── floor/
│       ├── app_database.dart    # Banco de dados Floor
│       ├── app_database.g.dart  # Código gerado
│       └── person_dao.dart      # DAO
├── ui/
│   ├── app.dart                 # Widget raiz
│   └── home_page.dart           # Tela principal
└── viewmodel/
    └── person_view_model.dart   # ViewModel
```

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
- Dispositivo físico ou emulador Android/iOS configurado

## Como rodar

### 1. Instalar dependências

```bash
flutter pub get
```

### 2. Rodar o app

```bash
flutter run
```

Para escolher um dispositivo específico:

```bash
flutter devices          # lista dispositivos disponíveis
flutter run -d <id>      # roda no dispositivo desejado
```

## Regenerar código do Floor

O arquivo `app_database.g.dart` é gerado automaticamente. Se alterar as entidades ou DAOs, rode:

```bash
dart run build_runner build --delete-conflicting-outputs
```
