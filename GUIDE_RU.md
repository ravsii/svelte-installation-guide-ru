# Гайд по установке Svelte.

В данном руководстве мы установим Svelte с связке с Routify и напишем небольшое приложение, которое будет отсылать запрос на тестовый сервер в интернете и получать ответ от него.

## Что это и почему

Svelte это фронтэнд фреймворк, который позволяет очень просто и быстро разрабатывать веб-приложения. Если вы слышали о таких вещах как React, AngularJS, то это из этой же серии.

По моему скромному мнению но намного приятнее и удобнее React (Angular сейчас используют заметно реже), из-за своей простоты, но имеет сообщество поменьше. Хотя если у вас возникнут какие-то вопросы, скорее всего в гугле ответ найдётся.

### А зачем Routify?

Svelte, в отличии от своих аналогов, представляет только [реактивность](https://svelte.dev/tutorial/reactive-declarations), работы с компонентами и всё что непосредственно связано с тем, за что отвечает браузер. Однако серверные задачи (такие как создание дополнительных страниц на сайте или роутинг) он выполнять не умеет. Для этого существуют фреймворки, которые реализуют серверную часть для него.

Их список:

- [Svelte Kit](https://kit.svelte.dev/) – официальный фреймворк
- [Sapper](https://sapper.svelte.dev/) - предшественник Svelte Kit
- [Routify](https://www.routify.dev/) - фреймворк от сторонних разработчиков, который специализируется на роутинге.

Routify довольно прост, так делает всего 2 вещи - работу со страницами и вложенные layout (об этом позже), так что нашим требованиям он отвечает.

## Установка

### Установка зависимостей

Скачиваем NodeJS с [официального сайта](https://nodejs.org/en), LTS версии будет достаточно, но можно и самую последнюю версию.

Если установка прошла успешно, то вы должны увидеть следующий результат в консоли

![](/guide_images/node_version.png)

_Если нет - то гуглите текст ошибки, скорее всего до вас кто-то уже сталкивался с подобным_

### Установка Svelte

Так как Svelte мы будем устанавливать в Routify - то мы можем использоваться уже готовый "стартер" проект, который они предоставляют в [официальном репозитории](https://github.com/roxiness/routify-starter).

Создаём папку, где у нас будет хранится проект, заходим туда через консоль и вводим:

```bash
npm init routify
```

![](/guide_images/install_y.png)

Соглашаемся (Пишем: "_y_")

![](/guide_images/install_select.png)

Далее нам предлагают выбрать версию. Выбираем Routify 2 (синий текст) и жмём Enter.

**Важно**: Если вторая версия уже не актуальная, и вам автоматически ставится 3, то в некоторых моментах надо будет самому в доках искать актуальную информацию. Сейчас на Beta версии немного изменён механизм `_layout.svelte`, которые стали модулями, работа с `$url()`, возможно что-то ещё будет изменено.

![](/guide_images/install_dir.png)

Если ваша директория не пуста (как у меня), то вас попросят утвердить, что вы хотите установить проект именно в эту директорию.

_Вполне возможно, что на этом этапе может вылезти ошибка, установите проект в пустую директорию, а потом переместите куда вам нужно_

После установки у вас должны появится папки `public` и `src`, и много всяких файлов.

![](/guide_images/install_ls.png)

#### Опционально: Tailwind CSS

Можно не устанавливать его и писать вёрстку самому, тут уже как хотите. Но данный фреймворк является практически обязательным, если планируете становится Frontend разрабочиком.

Для установки Tailwind воспользуемся двумя источниками, [обычной установкой](https://tailwindcss.com/docs/installation) и [установкой для Vite](https://tailwindcss.com/docs/guides/vite). Второй источник нужен для добавления Tailwind к Vite (серверный фреймворк, который использует Routify).

```bash
npm install -D tailwindcss postcss autoprefixer # Установим зависимости.
npx tailwindcss init # Создаём стандартный конфигурационный файл.
```

Результат:

![](/guide_images/install_tailwind.png)

Из [гайда для SvelteKit](https://tailwindcss.com/docs/guides/sveltekit) укажим, в каких файлах будет работать Tailwind, и запишем это в наш только-что созданный `tailwind.config.js`, который теперь должен выглядеть примерно так:

```typescript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    content: [],
    extend: {},
  },
  plugins: [],
}
```

Далее переходим в `/src/global.css`, удаляем всё оттуда и добавляем директивы импорта Tailwind.

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

Далее мы должны импортировать Tailwind в корень Svelte проекта. Заходим в соседний файл `App.svelte` и добавляем в импорт наш `global.css`. Должно получиться как-то так.

```svelte
<script>
  import { Router } from '@roxi/routify'
  import { routes } from '../.routify/routes'
  import './global.css'
</script>

<Router routes="{routes}" />
```

```typescript
module.exports = {
  plugins: [require('tailwindcss'), require('autoprefixer')],
}
```

### Тестовый запуск

#### Tailwind CSS: проверка импорта

#### Ошибка: `sh: run-p: command not found`

Потеряли зависимость, попробуйте

```bash
npm i npm-run-all
```

## Разработка

### Структура проекта

### Компоненты

### Отправка и обработка запросов

## Полезные ссылки

В основном ссылки на офф. доки, потому что по большинству вопросов там есть ответы, стоит лишь поискать.

- https://www.google.com/
- https://svelte.dev/tutorial/basics - Официальный гайд по всем возможностям. Есть версия на русском [тут](https://ru.svelte.dev/tutorial/basics), однако обычно там ошибка, если заходить без ВПН.
- https://tailwindcss.com/ - Все классы Tailwind
- https://daisyui.com/ - Обёртка поверх Tailwind, в которой есть готовые компоненты. Несколько упрощает жизнь.