typedef struct ListNode
{
	struct ListNode *next;
	int val;
} ListNode;

#include <stdlib.h>
#include <stdio.h>

void insert(ListNode *pHead, int val)
{
	ListNode *newNode = malloc(sizeof(ListNode));
	newNode->val = val;
	newNode->next = NULL;

	ListNode *next = pHead->next;

	pHead->next = newNode;
	newNode->next = next;
}

int main()
{
	ListNode head;
	head.next = NULL;
	insert(&head, 1);
	insert(&head, 2);
	insert(&head, 3);

	ListNode *ptr = head.next;

	while (ptr)
	{
		printf("%d ", ptr->val);
		ptr = ptr->next;
	}

	printf("\n");

	return 0;
}
