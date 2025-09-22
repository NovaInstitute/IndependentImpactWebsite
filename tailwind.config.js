/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./layouts/**/*.html",
    "./content/**/*.{html,md}",
    "./assets/js/**/*.js"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        heading: ['Plus Jakarta Sans', 'sans-serif'],
      },
      colors: {
        primary: {
          500: 'var(--brand-blue-500)',
          600: 'var(--brand-blue-700)',
          700: 'var(--brand-blue-800)',
        },
        brand: {
          blue: {
            500: 'var(--brand-blue-500)',
            700: 'var(--brand-blue-700)',
            800: 'var(--brand-blue-800)',
          },
          navy: 'var(--trust-navy)',
        },
        verify: {
          green: {
            700: 'var(--verify-green-700)',
          },
        },
        accent: {
          cyan: 'var(--accent-cyan)',
        },
        warn: {
          amber: {
            500: 'var(--amber-500)',
            700: 'var(--amber-700)',
          },
        },
        error: {
          red: {
            600: 'var(--error-600)',
          },
        },
        background: 'var(--bg)',
        surface: 'var(--surface)',
        border: 'var(--border)',
        body: {
          DEFAULT: 'var(--text)',
          2: 'var(--text-2)',
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
};