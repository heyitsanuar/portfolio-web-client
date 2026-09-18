export interface ExperienceEntry {
  company: string;
  role: string;
  startYear: number;
  endYear: number;
  responsibilities: readonly string[];
  technologies: readonly string[];
}

export const experienceEntries = [
  {
    company: 'Oracle',
    role: 'Senior Software Engineer',
    startYear: 2022,
    endYear: 2026,
    responsibilities: [
      'Developed JavaScript and Knockout.js client platforms within a large-scale multi-tenant architecture.',
      'Collaborated on backend development in the Java ecosystem.',
      'Worked with Gradle-based build tooling, controlled release cycles, and versioned deployments.',
    ],
    technologies: ['JavaScript', 'TypeScript', 'Knockout.js', 'Java', 'Selenium', 'Jenkins', 'Gradle'],
  },
  {
    company: 'Globant',
    role: 'Senior Frontend Engineer',
    startYear: 2021,
    endYear: 2022,
    responsibilities: [
      'Developed micro-frontends with React, Redux, and TypeScript.',
      'Integrated frontend applications with Node.js backends.',
      'Tested frontend behavior with Jest and React Testing Library.',
    ],
    technologies: ['React', 'Redux', 'TypeScript', 'Node.js', 'Jest', 'React Testing Library'],
  },
  {
    company: 'Tech Mahindra',
    role: 'Senior Software Engineer',
    startYear: 2020,
    endYear: 2021,
    responsibilities: [
      'Developed frontend applications with React, Redux, and RxJS.',
      'Integrated frontend work with .NET services and Cosmos DB.',
      'Worked with Azure CI/CD and testing using Jest and Enzyme.',
    ],
    technologies: ['React', 'Redux', 'RxJS', '.NET', 'Azure', 'Cosmos DB', 'Jest', 'Enzyme'],
  },
  {
    company: 'Improving',
    role: 'FullStack JavaScript Developer',
    startYear: 2019,
    endYear: 2020,
    responsibilities: [
      'Developed frontend applications with React and Redux.',
      'Integrated applications with Node.js and .NET backends.',
      'Built a Vue.js and Vuex multi-tenant proof of concept.',
      'Worked with Azure CI/CD.',
    ],
    technologies: ['React', 'Redux', 'Node.js', '.NET', 'Vue.js', 'Vuex', 'Azure'],
  },
] as const satisfies readonly ExperienceEntry[];
