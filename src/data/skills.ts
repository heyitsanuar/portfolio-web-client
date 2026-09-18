export const skillCategories = [
  { id: 'all', label: 'All' },
  { id: 'frontend', label: 'Frontend' },
  { id: 'backend', label: 'Backend' },
  { id: 'cloud-devops', label: 'Cloud & DevOps' },
  { id: 'ai-agents', label: 'AI & Agents' },
  { id: 'testing', label: 'Testing' },
  { id: 'others', label: 'Others' },
] as const;

export type SkillCategory = Exclude<(typeof skillCategories)[number]['id'], 'all'>;

export type SkillIconName =
  | 'javascript'
  | 'typescript'
  | 'react'
  | 'redux'
  | 'vuedotjs'
  | 'knockout'
  | 'reactivex'
  | 'nodedotjs'
  | 'java'
  | 'dotnet'
  | 'azure'
  | 'jenkins'
  | 'chatgpt'
  | 'claude'
  | 'githubcopilot'
  | 'cursor'
  | 'modelcontextprotocol'
  | 'jest'
  | 'testinglibrary'
  | 'selenium'
  | 'gradle';

export interface Skill {
  name: string;
  icon: SkillIconName;
}

export interface SkillGroup {
  id: SkillCategory;
  label: string;
  skills: readonly Skill[];
}

export const skillGroups = [
  {
    id: 'frontend',
    label: 'Frontend',
    skills: [
      { name: 'JavaScript', icon: 'javascript' },
      { name: 'TypeScript', icon: 'typescript' },
      { name: 'React', icon: 'react' },
      { name: 'Redux', icon: 'redux' },
      { name: 'Vue.js', icon: 'vuedotjs' },
      { name: 'Knockout.js', icon: 'knockout' },
      { name: 'RxJS', icon: 'reactivex' },
    ],
  },
  {
    id: 'backend',
    label: 'Backend',
    skills: [
      { name: 'Node.js', icon: 'nodedotjs' },
      { name: 'Java', icon: 'java' },
      { name: '.NET', icon: 'dotnet' },
    ],
  },
  {
    id: 'cloud-devops',
    label: 'Cloud & DevOps',
    skills: [
      { name: 'Azure', icon: 'azure' },
      { name: 'Jenkins', icon: 'jenkins' },
    ],
  },
  {
    id: 'ai-agents',
    label: 'AI & Agents',
    skills: [
      { name: 'ChatGPT', icon: 'chatgpt' },
      { name: 'Claude Code', icon: 'claude' },
      { name: 'GitHub Copilot', icon: 'githubcopilot' },
      { name: 'Cursor', icon: 'cursor' },
      { name: 'MCP', icon: 'modelcontextprotocol' },
    ],
  },
  {
    id: 'testing',
    label: 'Testing',
    skills: [
      { name: 'Jest', icon: 'jest' },
      { name: 'React Testing Library', icon: 'testinglibrary' },
      { name: 'Selenium', icon: 'selenium' },
    ],
  },
  {
    id: 'others',
    label: 'Others',
    skills: [{ name: 'Gradle', icon: 'gradle' }],
  },
] as const satisfies readonly SkillGroup[];
