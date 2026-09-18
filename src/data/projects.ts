export interface Project {
  title: string;
  description: string;
  technologies: readonly string[];
  demoUrl?: string;
  repositoryUrl?: string;
  isPlaceholder: boolean;
}

export const projects = [
  {
    title: 'Travel Hub',
    description:
      'A fictional trip-planning workspace for organizing destinations, itineraries, and shared travel notes.',
    technologies: ['React', 'TypeScript', 'Node.js'],
    isPlaceholder: true,
  },
  {
    title: 'Finance Dashboard',
    description:
      'A fictional dashboard concept for exploring account summaries, budget categories, and financial trends.',
    technologies: ['Astro', 'TypeScript', 'CSS'],
    isPlaceholder: true,
  },
  {
    title: 'Task Tracker',
    description:
      'A fictional productivity tool for arranging tasks, project notes, and day-to-day priorities in one place.',
    technologies: ['React', 'Node.js', 'PostgreSQL'],
    isPlaceholder: true,
  },
  {
    title: 'Developer Tools Dashboard',
    description:
      'A fictional workspace concept that brings build status, documentation shortcuts, and developer tools together.',
    technologies: ['Astro', 'TypeScript', 'Tailwind CSS'],
    isPlaceholder: true,
  },
] as const satisfies readonly Project[];
