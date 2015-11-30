# Questions for Companies

![Can't a man walk down the street without being offered a job?!](http://i.imgur.com/ndVA6qs.png)

This project is essentially a [series of questions](https://github.com/DrummerHead/questions-for-companies/blob/master/app/templates/template-en.md) that you can ask a company that is interested in hiring you before any of you invest time in a personal interview.

The questions aim to be general (for now geared towards developers) and standardized over time with the help of the community. You can edit the questions as you see fit for your personal situation and you can automatically fill the questions with your [personal data and the data of the interested party](https://github.com/DrummerHead/questions-for-companies/blob/master/app/config.example.yml).


## Building the questions

1. Fork this repo and `git clone` the fork to your machine.

2. Copy `./app/config.example.yml` to `./app/config.yml` and edit the new file with your personal data, data of the company and person that got in touch with you & date. Don't delete `./app/config.example.yml`.

3. In the `template_path` field in `./app/config.yml` you can select a question template, currently these templates differ only in language (Spanish and English) and are the same questions

4. Feel free to edit the template file and use `{{value.subvalue}}` statements; this information is taken from `config.yml`.

5. After you are done, run `./build` inside of the `app` folder to generate the questions file to send the person that got in touch with you. `txt` format is preferred since it's more probable to be understood by a non-technical party than `md`, but you can change this setting in the `file_metadata.extension` setting.

6. You can now run `./backup` to backup `config.yml` and reset it (with information from `config.example.yml`)


## Contributing

Take your fork and add new question categories and/or questions you think are missing. You could add new categories of questions in the form of new template files for different professions; questions that designers, civil engineers or managers would ask a possible employer.

Feel free to add translations to your preferred language too. Thanks!
