# AIMH Clinic

The clinic pages are served through the Next.js App Router and can be deployed
to Vercel. The existing Firebase Authentication and Firestore setup remains the
application data layer. Clinic pages are kept as client-rendered legacy screens
behind the Next route shell while preserving their current role checks and
workflows.

## Run locally

```sh
npm install
npm run dev
```

Open `http://localhost:3000`. The existing Firebase web configuration is used by
the clinic client. Do not put test-account credentials or other private values
in `NEXT_PUBLIC_*` variables.

Local test account values copied from `profile.txt` are stored in the ignored
`.env.local` file as `TEST_*` variables. They are not used by the browser app.
Use `.env.example` as the variable-name reference; do not commit `.env.local`.

## Deploy to Vercel

Import the repository as a Next.js project and deploy with the default build
command (`npm run build`). Vercel Web Analytics and Speed Insights are included
in the App Router layout and activate on Vercel deployments. They may also be
enabled in the Vercel project dashboard to view their reports.

Vercel serves the shared stylesheet and Firebase client module from App Router
route handlers. The original clinic URLs (including `.html` links) remain
supported while the screens are transitioned.