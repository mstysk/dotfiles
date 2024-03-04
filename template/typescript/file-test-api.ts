import { testApiHandler } from 'next-test-api-route-handler'

import handler from '../{{__name__}}'

describe('{{__name__}} endpoint test', () => {
  test('should be get 200 ok', async () => {
    await testApiHandler({
      handler,
      test: async ({ fetch }) => {
        const res = await fetch()
        expect(res.status).toBe(200)
      },
    })
  })
  test.each(['PUT', 'POST', 'DELETE', 'PATCH'])('shoud method not allowed error', async (method: string) => {
    await testApiHandler({
      handler,
      test: async ({ fetch }) => {
        const res = await fetch({
          method,
        })
        expect(res.status).toBe(405)
      },
    })
  })
})
