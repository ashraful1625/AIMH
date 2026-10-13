'use client';

import { useEffect, useRef } from 'react';

export default function LegacyPage({ html }) {
  const mountRef = useRef(null);

  useEffect(() => {
    const parsed = new DOMParser().parseFromString(html, 'text/html');
    const previousTitle = document.title;
    const previousBodyClass = document.body.className;
    const addedHeadNodes = [];
    document.title = parsed.title || 'A Islam Medical Hall';
    document.body.className = parsed.body.className;

    const base = document.createElement('base');
    base.href = '/';
    document.head.prepend(base);
    addedHeadNodes.push(base);

    parsed.head.querySelectorAll('link[rel],meta[name="theme-color"]').forEach(node => {
      if (node.tagName === 'LINK' && node.rel === 'stylesheet' &&
          document.head.querySelector(`link[rel="stylesheet"][href="${node.getAttribute('href')}"]`)) return;
      const copy = document.createElement(node.tagName.toLowerCase());
      for (const attribute of node.attributes) copy.setAttribute(attribute.name, attribute.value);
      document.head.appendChild(copy);
      addedHeadNodes.push(copy);
    });

    const mount = mountRef.current;
    mount.replaceChildren(...Array.from(parsed.body.childNodes).filter(
      node => !(node.nodeType === Node.ELEMENT_NODE && node.tagName === 'SCRIPT')
    ));

    let cancelled = false;
    async function runScripts() {
      for (const original of parsed.body.querySelectorAll('script')) {
        if (cancelled) return;
        const script = document.createElement('script');
        for (const attribute of original.attributes) {
          script.setAttribute(attribute.name, attribute.value);
        }
        script.textContent = original.textContent;
        if (script.src || script.type === 'module') {
          await new Promise((resolve, reject) => {
            script.addEventListener('load', resolve, { once: true });
            script.addEventListener('error', () => reject(
              new Error(`Failed to load ${script.src || 'page module script'}`)
            ), { once: true });
            document.body.appendChild(script);
          });
        } else {
          document.body.appendChild(script);
        }
      }
    }

    runScripts().catch(error => {
      console.error('Could not start the clinic page:', error);
      window.alert(`Could not start this page: ${error.message}`);
    });

    return () => {
      cancelled = true;
      mount.replaceChildren();
      addedHeadNodes.forEach(node => node.remove());
      document.body.className = previousBodyClass;
      document.title = previousTitle;
    };
  }, [html]);

  return <div ref={mountRef} />;
}
