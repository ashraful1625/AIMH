import { readFile } from 'node:fs/promises';
import path from 'node:path';
import { notFound, redirect } from 'next/navigation';
import LegacyPage from '../../legacy/legacy-page';

export const dynamic = 'force-static';

const pages = [
  'billing',
  'company_bill',
  'dashboard',
  'members',
  'overall_reports',
  'passwords',
  'patient',
  'prescription',
  'stock'
];

export function generateStaticParams() {
  return pages.flatMap(slug => [{ slug }, { slug: `${slug}.html` }])
    .concat([{ slug: 'index.html' }]);
}

export default async function ClinicPage({ params }) {
  const { slug: requestedSlug } = await params;
  const slug = requestedSlug.endsWith('.html')
    ? requestedSlug.slice(0, -5)
    : requestedSlug;

  if (slug === 'index') redirect('/');
  if (!pages.includes(slug)) notFound();

  const html = await readFile(path.join(process.cwd(), `${slug}.html`), 'utf8');
  return <LegacyPage html={html} />;
}
