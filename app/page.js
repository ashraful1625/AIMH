import { readFile } from 'node:fs/promises';
import path from 'node:path';
import LegacyPage from '../legacy/legacy-page';

export const dynamic = 'force-static';

export default async function HomePage() {
  const html = await readFile(path.join(process.cwd(), 'index.html'), 'utf8');
  return <LegacyPage html={html} />;
}
