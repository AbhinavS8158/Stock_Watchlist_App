import 'package:bmtask/constant.dart';
import 'package:flutter/material.dart';

Widget buildListTile(String name,String?score){
  return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius:
                    BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.black,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.green
                          .withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.trending_up,
                      color: AppColor.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          style:
                              const TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Score: $score",
                          style:
                              const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 67, 77, 105),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
}