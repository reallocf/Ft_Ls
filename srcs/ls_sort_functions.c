/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_sort_functions.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/13 23:45:22 by csummers          #+#    #+#             */
/*   Updated: 2016/12/13 23:45:23 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

static void		right_shift(char **a, char **shift_pt)
{
	char	*temp;

	temp = *shift_pt;
	while (shift_pt >= a)
	{
		*shift_pt = *(shift_pt - 1);
		shift_pt--;
	}
	*a = temp;
}

static void		ls_quick_sort(char **a, char **z, t_ls *ls_f,
								long (*cmp)(const char *, const char *, t_ls *))
{
	char	**pivot;
	char	**ptr;
	_Bool	shift;

	pivot = a;
	ptr = a + 1;
	shift = 0;
	while (ptr < z)
	{
		if (cmp(*ptr, *pivot, ls_f) > 0)
		{
			right_shift(a, ptr);
			pivot++;
			shift = 1;
		}
		ptr++;
	}
	if (shift)
		ls_quick_sort(a, pivot, ls_f, cmp);
	if (pivot + 1 != z)
		ls_quick_sort(pivot + 1, z, ls_f, cmp);
}

void			ls_sort_files(char **files, t_ls *ls_f, _Bool one)
{
	char	**end;

	if (ls_f->f)
		return ;
	end = files + ft_strarrlen(files);
	if (ls_f->t && !ls_f->l && one)
		ls_quick_sort(files, end, ls_f, ls_time_cmp);
	else if (ls_f->t)
		ls_quick_sort(files, end, ls_f, ls_time_cmp_l);
	else
		ls_quick_sort(files, end, ls_f, ls_str_cmp);
}
