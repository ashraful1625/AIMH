import asyncio
from playwright.async_api import async_playwright
import os

async def run():
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        context = await browser.new_context(viewport={'width': 1280, 'height': 800})
        page = await context.new_page()

        # Port 3000 should be running from previous steps
        await page.goto('http://localhost:3000')
        await asyncio.sleep(2)

        # 1. Login as Admin
        await page.click('button:has-text("Admin")')
        await page.fill('#lpass', 'admin123')
        await page.click('button:has-text("Login")')
        await asyncio.sleep(2)
        await page.screenshot(path='v2_01_admin_dashboard.png')

        # 2. Prescription Preview
        await page.click('button:has-text("Rx")')
        await page.fill('#rxname', 'Test Patient')
        await page.click('button:has-text("Preview")')
        await asyncio.sleep(1)
        await page.screenshot(path='v2_02_rx_preview.png')
        await page.click('button:has-text("Close")')

        # 3. Billing Preview
        # Need to load a prescription first in billing
        # For simplicity, we can just click billing and see the layout
        await page.click('button:has-text("Billing")')
        await asyncio.sleep(1)
        await page.screenshot(path='v2_03_billing_module.png')

        # 4. Reports
        await page.click('button:has-text("Reports")')
        await asyncio.sleep(1)
        await page.screenshot(path='v2_04_reports_module.png')
        await page.click('button:has-text("Print Report")')
        await asyncio.sleep(1)
        await page.screenshot(path='v2_05_report_preview.png')
        await page.click('button:has-text("Close")')

        # 5. Members
        await page.click('button:has-text("Members")')
        await asyncio.sleep(1)
        await page.screenshot(path='v2_06_members_module.png')

        # 6. Passwords
        await page.click('button:has-text("Passwords")')
        await asyncio.sleep(1)
        await page.screenshot(path='v2_07_passwords_module.png')

        # 7. Company Bills
        await page.click('button:has-text("Co Bills")')
        await asyncio.sleep(1)
        await page.screenshot(path='v2_08_cobills_module.png')

        await browser.close()

if __name__ == "__main__":
    asyncio.run(run())
